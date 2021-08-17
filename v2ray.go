package libcore

import (
	"errors"
	"fmt"
	"io"
	"log"
	"os"
	"strings"
	"sync"

	appLog "github.com/xtls/xray-core/app/log"
	commonLog "github.com/xtls/xray-core/common/log"
	"github.com/xtls/xray-core/common/platform/filesystem"
	core "github.com/xtls/xray-core/core"
	"github.com/xtls/xray-core/features/stats"
	"github.com/xtls/xray-core/infra/conf/serial"
	_ "github.com/xtls/xray-core/main/distro/all"
)

func GetV2RayVersion() string {
	return core.Version()
}

var geoAssetsPath string

func InitializeV2Ray(assetsPath string, assetsPrefix string, memReader bool) error {

	geoAssetsPath = assetsPath

	filesystem.NewFileReader = func(path string) (io.ReadCloser, error) {
		return openAssets(assetsPrefix, path, memReader)
	}

	return nil
}

type stdoutLogWriter struct {
	logger *log.Logger
}

func (w *stdoutLogWriter) Write(s string) error {
	w.logger.Print(s)
	return nil
}

func (w *stdoutLogWriter) Close() error {
	return nil
}

func init() {
	_ = appLog.RegisterHandlerCreator(appLog.LogType_Console,
		func(lt appLog.LogType,
			options appLog.HandlerCreatorOptions) (commonLog.Handler, error) {
			logger := log.New(os.Stdout, "", 0)
			return commonLog.NewLogger(func() commonLog.Writer {
				return &stdoutLogWriter{
					logger: logger,
				}
			}), nil
		})
}

type V2RayInstance struct {
	access       sync.Mutex
	started      bool
	core         *core.Instance
	statsManager stats.Manager
}

func NewV2rayInstance() V2RayInstance {
	return V2RayInstance{}
}

func (instance *V2RayInstance) LoadConfig(content string) error {
	instance.access.Lock()
	defer instance.access.Unlock()
	config, err := serial.LoadJSONConfig(strings.NewReader(content))
	if err != nil {
		return err
	}
	c, err := core.New(config)
	if err != nil {
		return err
	}
	instance.core = c
	instance.statsManager = c.GetFeature(stats.ManagerType()).(stats.Manager)
	return nil
}

func (instance *V2RayInstance) Start() error {
	instance.access.Lock()
	defer instance.access.Unlock()
	if instance.started {
		return errors.New("already started")
	}
	if instance.core == nil {
		return errors.New("not initialized")
	}
	err := instance.core.Start()
	if err != nil {
		return err
	}
	instance.started = true
	return nil
}

func (instance *V2RayInstance) QueryStats(tag string, direct string) int64 {
	if instance.statsManager == nil {
		return 0
	}
	counter := instance.statsManager.GetCounter(fmt.Sprintf("outbound>>>%s>>>traffic>>>%s", tag, direct))
	if counter == nil {
		return 0
	}
	return counter.Set(0)
}

func (instance *V2RayInstance) Close() error {
	instance.access.Lock()
	defer instance.access.Unlock()
	if instance.started {
		return instance.core.Close()
	}
	return nil
}

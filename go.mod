module libcore

go 1.17

require (
	github.com/Dreamacro/clash v1.6.5
	github.com/miekg/dns v1.1.43
	github.com/pkg/errors v0.9.1
	github.com/sagernet/gomobile v0.0.0-20210905032500-701a995ff844
	github.com/sagernet/libping v0.1.1
	github.com/sagernet/sagerconnect v0.1.7
	github.com/sirupsen/logrus v1.8.1
	github.com/ulikunitz/xz v0.5.10
	github.com/xtls/xray-core v1.4.3
	golang.org/x/crypto v0.0.0-20210817164053-32db794688a5
	golang.org/x/sys v0.0.0-20210909193231-528a39cd75f3
	gvisor.dev/gvisor v0.0.0
)

require (
	github.com/Dreamacro/go-shadowsocks2 v0.1.7 // indirect
	github.com/cheekybits/genny v1.0.0 // indirect
	github.com/dgryski/go-metro v0.0.0-20200812162917-85c65e2d0165 // indirect
	github.com/fsnotify/fsnotify v1.5.1 // indirect
	github.com/ghodss/yaml v1.0.1-0.20190212211648-25d852aebe32 // indirect
	github.com/go-task/slim-sprig v0.0.0-20210107165309-348f09dbbbc0 // indirect
	github.com/gofrs/uuid v4.0.0+incompatible // indirect
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/google/btree v1.0.1 // indirect
	github.com/gorilla/websocket v1.4.2 // indirect
	github.com/lucas-clemente/quic-go v0.23.0 // indirect
	github.com/marten-seemann/qtls-go1-16 v0.1.4 // indirect
	github.com/marten-seemann/qtls-go1-17 v0.1.0 // indirect
	github.com/nxadm/tail v1.4.8 // indirect
	github.com/onsi/ginkgo v1.16.4 // indirect
	github.com/pelletier/go-toml v1.9.4 // indirect
	github.com/pires/go-proxyproto v0.6.0 // indirect
	github.com/refraction-networking/utls v0.0.0-20210713165636-0b2885c8c0d4 // indirect
	github.com/seiflotfy/cuckoofilter v0.0.0-20201222105146-bc6005554a0c // indirect
	github.com/xtls/go v0.0.0-20201118062508-3632bf3b7499 // indirect
	go.starlark.net v0.0.0-20210901212718-87f333178d59 // indirect
	go.uber.org/atomic v1.9.0 // indirect
	golang.org/x/mod v0.5.0 // indirect
	golang.org/x/net v0.0.0-20210903162142-ad29c8ab022f // indirect
	golang.org/x/text v0.3.7 // indirect
	golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac // indirect
	golang.org/x/tools v0.1.5 // indirect
	golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1 // indirect
	google.golang.org/genproto v0.0.0-20210903162649-d08c68adba83 // indirect
	google.golang.org/grpc v1.40.0 // indirect
	google.golang.org/protobuf v1.27.1 // indirect
	gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
)

replace gvisor.dev/gvisor v0.0.0 => github.com/sagernet/gvisor v0.0.0-20210909160323-ce37d6df1e92

replace github.com/xtls/xray-core v1.4.3 => github.com/nekohasekai/xray-core v1.4.3-0.20210907235018-5108f6197804

package libcore

import (
	"github.com/xtls/xray-core/common"
	"log"
)

func safeClose(closable common.Closable) {
	err := closable.Close()
	if err != nil {
		log.Printf("Failed to close %v: %v", closable, err)
	}
}

package schema

import (
	"time"
)

type TelemetryData struct {
	Timestamp 				time.Time
	IPAddress 				string
	ISPInfo   				string
	Server    				string
	SpeedtestSessionUUID	string
	Extra     				string
	UserAgent 				string
	Language  				string
	Download  				string
	Upload    				string
	Ping     				string
	Jitter    				string
	Log       				string
	UUID      				string
}

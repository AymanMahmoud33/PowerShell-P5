Configuration PushDemo {
    node dc2 {
        WindowsFeature Backup {
            Ensure = 'Present'
            Name = 'Windows-Server-Backup'
        }
        WindowsFeature Telnet {
            Ensure = 'NotPresent'
            Name = 'Telnet-Server'
        }
    }
}
PushDemo
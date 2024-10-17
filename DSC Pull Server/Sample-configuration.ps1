Configuration PullDemo {
    node dc2 {
        WindowsFeature Backup {
            Ensure = 'Present'
            Name = 'Windows-Server-Backup'
        }
        WindowsFeature Telnet {
            Ensure = 'Absent'
            Name = 'Telnet-Server'
        }
    }
}
PullDemo

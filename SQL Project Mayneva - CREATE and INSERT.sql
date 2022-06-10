CREATE TABLE User(
UserID INTEGER PRIMARY KEY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Company VARCHAR(30) NOT NULL,
Email VARCHAR(30) NOT NULL UNIQUE);

CREATE TABLE Service(
ServiceID INTEGER PRIMARY KEY,
ServiceName VARCHAR(30) NOT NULL UNIQUE,
Criticality VARCHAR(12) NOT NULL);

CREATE TABLE ConfigurationItem(
CIID INTEGER PRIMARY KEY,
CIName VARCHAR(12) UNIQUE,
CIType VARCHAR(12) NOT NULL);

CREATE TABLE ResolverGroup(
GroupID INTEGER PRIMARY KEY,
GroupName VARCHAR(30) NOT NULL UNIQUE,
GroupDescription VARCHAR(1000));

CREATE TABLE Coordinator(
CoordinatorID INTEGER PRIMARY KEY,
FName VARCHAR(30) NOT NULL,
LName VARCHAR(30) NOT NULL,
Position VARCHAR(30) NOT NULL,
Department VARCHAR(30),
Email VARCHAR(30) NOT NULL UNIQUE);

CREATE TABLE Request(
RequestID INTEGER,
UserID INTEGER,
ServiceID INTEGER,
CIID INTEGER,
Priority VARCHAR(12) NOT NULL,
GroupID INTEGER,
CoordinatorID INTEGER,
RequestDescription VARCHAR(1000) NOT NULL,
StartTime DATETIME NOT NULL,
EndTime DATETIME,
Resolution VARCHAR(1000),

PRIMARY KEY(RequestID),
FOREIGN KEY(UserID) REFERENCES User(UserID),
FOREIGN KEY(ServiceID) REFERENCES Service(ServiceID),
FOREIGN KEY(CIID) REFERENCES ConfigurationItem(CIID),
FOREIGN KEY(GroupID) REFERENCES ResolverGroup(GroupID),
FOREIGN KEY(CoordinatorID) REFERENCES Coordinator(CoordinatorID))
;

INSERT INTO User
VALUES (1, 'Christopher', 'Berry', 'New Solution', 'cberry@newsolutions.com'),
(2, 'Osiris', 'Downey', 'New solutions', 'odowney@newsolutions.com'),
(3, 'Justine', 'Dotton', 'New solutions', 'jdutton@newsolutions.com'),
(4, 'Shannon', 'Lynch', 'Ecovision', 'slynch@ecovision.com'),
(5, 'Liz', 'Hill', 'Ecovision', 'lhill@ecovision.com'),
(6, 'Sarah', 'Cruz', 'Robots for your home', 'scruz@robots4home.com'),
(7, 'Hanna', 'Mantel', 'Pioneers', 'hmantel@pioneers.com'),
(8, 'Taylor', 'Perron', 'Pioneers', 'tperron@pioneers.com'),
(9, 'Jack', 'Mitchell', 'Pioneers', 'jmitchell@pioneers.com'),
(10, 'Veronica', 'Sloan', 'Pioneers', 'vsloan@pioneers.com');


INSERT INTO Coordinator
VALUES (1, 'Kate', 'Tyler', 'Supervisor', 'IT', 'ktyler@quickresponce.com'),
(2, 'Gena', 'Zinser', 'Senior IT Service Desk Analyst', 'IT', 'gzinser@quickresponce.com'),
(3, 'John', 'Marcus', 'Supervisor', 'Security', 'gmarcus@quickresponce.com'),
(4, 'Peter', 'Apgar', 'Supervisor', 'Security', 'papgar@quickresponce.com'),
(5, 'Joy', 'Uskali', 'IT Help Desk Associate', 'IT', 'juskali@quickresponce');

INSERT INTO Service
VALUES (1, 'SalesForce', 'Critical'),
(2, 'AD', 'Critical'),
(3, 'SAP', 'Critical'),
(4, 'WorkDay', 'Critical'),
(5, 'Jira', 'Non-critical'),
(6, 'ServiceNow', 'Critical'),
(7, 'Intranet', 'Non-critical'),
(8, 'Undefined', 'Non-critical');

INSERT INTO ConfigurationItem
VALUES (1, 'sap0057', 'Server'),
(2, 'frw23', 'Firewall'),
(3, 'jira32', 'Server'),
(4, 'sapbd', 'Server'),
(5, 'wd03', 'Server');

INSERT INTO ResolverGroup
VALUES (1, 'SQL Administrators', NULL),
(2, 'AD ADministrators', 'Access to directories and folders'),
(3, 'Help Desk', 'First line support. Working hour 24\7. Phone 55-555'),
(4, 'CRM Administrators', 'CRM access problems'),
(5, 'Technical Support', 'Remote configuration of workplaces. Installation of software, printers. We do not reset passwords!');

INSERT INTO Request
VALUES (1, 1, 3, 1, 'LOW', 3, 5, 'I need to change  my personal data in SAP HR. How can I do it?', '2020-12-9 12:00', '2020-12-9 14:00', 'You must submit an application on the intranet portal'),
(2, 1, 7, 5, 'MEDIUM', 3, 2, 'When I open intranet portal I receive error 404.', '2019-10-15 16:22', '2019-10-17 16:59', 'We have sent you new link'),
(3, 2, 5, 3, 'MEDIUM', 3, 1, 'I forgot my password from Jira.Atlassian', '2018-2-16 09:30', '2018-2-19 09:00', 'Password has been reset, please login again'),
(4, 2, 1, 1, 'LOW', 4, 1, 'I forgot my password from CRM program', '2021-2-20 15:36', NULL, NULL),
(5, 2, 1, 5, 'HIGH', 4, 2, 'Incorrect data in SalesForce', '2020-4-15 15:15', '2020-4-15 17:40', 'Fixed'),
(6, 3, 8, 5, 'MEDIUM', 5, 5, 'my printer does not work', '2020-4-4 13:45', '2020-4-8 13:25', 'Configured'),
(7, 5, 2, 5, 'LOW', 2, 2, 'How can I receive an access to the folder "International reports"?', '2018-4-18 12:12', '2018-4-22 12:12', 'You must submit an application on the intranet portal'),
(8, 6, 8, 5, 'HIGH', 1, 3, 'DB error', '2017-11-16 09:00', '2017-11-16 16:50', 'Fixed'),
(9, 7, 2, 2, 'HIGH', 2, 4, 'incorrect access in AD', '2021-1-1 08:20', '2021-1-2 12:20', 'The access is correct. The specified access is not agreed for you.'),
(10, 8, 2 ,2, 'MEDIUM', 2, 4, 'I can not open the protected document from the archive', '2020-6-4 17:59', '2020-6-5 09:30', 'Fixed');

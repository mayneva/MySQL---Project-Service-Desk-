SELECT ServiceName AS 'Service name', Criticality FROM Service
WHERE Criticality = 'Critical';

SELECT FirstName, LastName, Company FROM User
GROUP BY LastName
HAVING Company = 'Ecovision' OR Company = 'Robots for your home'
ORDER BY LastName;

SELECT Requestid, priority, groupid FROM Request
WHERE Priority = 'MEDIUM' AND GroupID = 3;

SELECT Department, COUNT(*) AS 'Coordinators in total' FROM Coordinator
GROUP BY Department;

SELECT GroupName FROM ResolverGroup
GROUP BY GroupName
HAVING GroupName LIKE '%administrators%'
ORDER BY GroupName DESC;

SELECT requestid, requestdescription, starttime, endtime from request
where StartTime >= '2020-1-1 00:00' AND StartTime <= '2020-12-31 23:59';

Select Requestid, Priority, RequestDescription, StartTime, EndTime, TIMESTAMPDIFF(hour, StartTime, EndTime) AS 'Request resolution time' FROM Request
GROUP BY TIMESTAMPDIFF(hour, StartTime, EndTime)
ORDER BY TIMESTAMPDIFF(hour, StartTime, EndTime) DESC; 

SELECT CITYPE AS 'Type of CI', COUNT(*) AS 'Quantity' FROM configurationitem
GROUP BY CIType DESC;

SELECT requestid AS 'Request ID', LastName AS 'User', requestdescription AS 'Problem description' FROM User
INNER JOIN Request ON request.requestid = user.userid
GROUP BY requestid 
ORDER BY requestid;

SELECT service.servicename as 'Service name', Count(RequestID) AS 'Numbers of requests' FROM request
RIGHT OUTER JOIN service ON service.serviceid = request.serviceid
GROUP BY service.serviceid
ORDER BY Count(RequestID) DESC;

SELECT configurationitem.ciname as 'Configuration item name', Count(RequestID) AS 'Numbers of requests' FROM request
RIGHT OUTER JOIN configurationitem ON configurationitem.ciid = request.ciid
GROUP BY configurationitem.ciid
ORDER BY Count(RequestID);

SELECT resolvergroup.GroupName as 'Resolver group name', Count(RequestID) AS 'Numbers of requests' FROM request
LEFT OUTER JOIN resolvergroup ON resolvergroup.GroupID = request.GroupID
GROUP BY resolvergroup.GroupID
ORDER BY Count(RequestID) DESC;







-- Dejavu default skill master data
-- category values are grouped for job notice skill mapping.

USE dejavu;

INSERT INTO skills (skill_name, category) VALUES
  -- Frontend / Web UI
  ('ActionScript', 'FRONTEND'),
  ('Ajax', 'FRONTEND'),
  ('Angular', 'FRONTEND'),
  ('Bootstrap', 'FRONTEND'),
  ('CSS', 'FRONTEND'),
  ('Flex', 'FRONTEND'),
  ('Gulp', 'FRONTEND'),
  ('HTML', 'FRONTEND'),
  ('JavaScript', 'FRONTEND'),
  ('jQuery', 'FRONTEND'),
  ('React', 'FRONTEND'),
  ('Redux', 'FRONTEND'),
  ('TypeScript', 'FRONTEND'),
  ('Vue.js', 'FRONTEND'),
  ('WebGL', 'FRONTEND'),
  ('Webpack', 'FRONTEND'),

  -- Backend / Server
  ('ABAP', 'BACKEND'),
  ('ASP', 'BACKEND'),
  ('ASP.NET', 'BACKEND'),
  ('Django', 'BACKEND'),
  ('Flask', 'BACKEND'),
  ('Go', 'BACKEND'),
  ('GraphQL', 'BACKEND'),
  ('Groovy', 'BACKEND'),
  ('JPA', 'BACKEND'),
  ('JSP', 'BACKEND'),
  ('MyBatis', 'BACKEND'),
  ('Node.js', 'BACKEND'),
  ('Perl', 'BACKEND'),
  ('PHP', 'BACKEND'),
  ('Pro-C', 'BACKEND'),
  ('REST API', 'BACKEND'),
  ('Ruby', 'BACKEND'),
  ('Scala', 'BACKEND'),
  ('Servlet', 'BACKEND'),
  ('Spring', 'BACKEND'),
  ('Spring Boot', 'BACKEND'),
  ('Tomcat', 'BACKEND'),
  ('Vert.x', 'BACKEND'),
  ('WAS', 'BACKEND'),

  -- Common Languages
  ('Java', 'LANGUAGE'),
  ('Python', 'LANGUAGE'),
  ('C#', 'LANGUAGE'),
  ('C++', 'LANGUAGE'),
  ('C', 'LANGUAGE'),
  ('.NET', 'LANGUAGE'),

  -- Fullstack / Shared
  ('Fullstack', 'FULLSTACK'),
  ('WebRTC', 'FULLSTACK'),
  ('XML', 'FULLSTACK'),

  -- Database / Storage
  ('HBase', 'DATABASE'),
  ('MariaDB', 'DATABASE'),
  ('MongoDB', 'DATABASE'),
  ('MSSQL', 'DATABASE'),
  ('MySQL', 'DATABASE'),
  ('NoSQL', 'DATABASE'),
  ('OracleDB', 'DATABASE'),
  ('PL/SQL', 'DATABASE'),
  ('PostgreSQL', 'DATABASE'),
  ('Redis', 'DATABASE'),
  ('SQL', 'DATABASE'),
  ('SQLite', 'DATABASE'),
  ('Sybase', 'DATABASE'),

  -- DevOps / Cloud / Infra
  ('Shell Script', 'DEVOPS'),
  ('Wireshark', 'DEVOPS'),
  ('AIX', 'DEVOPS'),
  ('Apache', 'DEVOPS'),
  ('AWS', 'DEVOPS'),
  ('Azure', 'DEVOPS'),
  ('CentOS', 'DEVOPS'),
  ('Docker', 'DEVOPS'),
  ('Elastic Stack', 'DEVOPS'),
  ('GCP', 'DEVOPS'),
  ('Git', 'DEVOPS'),
  ('IaaS', 'DEVOPS'),
  ('Jenkins', 'DEVOPS'),
  ('Kubernetes', 'DEVOPS'),
  ('Linux', 'DEVOPS'),
  ('Logstash', 'DEVOPS'),
  ('Maven', 'DEVOPS'),
  ('macOS', 'DEVOPS'),
  ('OSS', 'DEVOPS'),
  ('PaaS', 'DEVOPS'),
  ('SaaS', 'DEVOPS'),
  ('Solaris', 'DEVOPS'),
  ('Splunk', 'DEVOPS'),
  ('SVN', 'DEVOPS'),
  ('Ubuntu', 'DEVOPS'),
  ('Unix', 'DEVOPS'),

  -- Mobile
  ('Android', 'MOBILE'),
  ('Flutter', 'MOBILE'),
  ('iOS', 'MOBILE'),
  ('Kotlin', 'MOBILE'),
  ('Objective-C', 'MOBILE'),
  ('React Native', 'MOBILE'),
  ('Swift', 'MOBILE'),

  -- Embedded / IoT / Hardware
  ('Raspberry Pi', 'EMBEDDED'),
  ('Arduino', 'EMBEDDED'),
  ('Assembly', 'EMBEDDED'),
  ('Embedded Linux', 'EMBEDDED'),
  ('LabVIEW', 'EMBEDDED'),
  ('Verilog', 'EMBEDDED'),

  -- Data / Big Data / AI
  ('Hadoop', 'DATA_AI'),
  ('Kafka', 'DATA_AI'),
  ('Keras', 'DATA_AI'),
  ('Matlab', 'DATA_AI'),
  ('OpenCV', 'DATA_AI'),
  ('Pandas', 'DATA_AI'),
  ('PyTorch', 'DATA_AI'),
  ('R', 'DATA_AI'),
  ('SAS', 'DATA_AI'),
  ('Spark', 'DATA_AI'),
  ('Storm', 'DATA_AI'),
  ('TensorFlow', 'DATA_AI'),

  -- Desktop / Game / Graphics
  ('PowerBuilder', 'DESKTOP_GAME'),
  ('Delphi', 'DESKTOP_GAME'),
  ('DirectX', 'DESKTOP_GAME'),
  ('Eclipse', 'DESKTOP_GAME'),
  ('MFC', 'DESKTOP_GAME'),
  ('OpenGL', 'DESKTOP_GAME'),
  ('Qt', 'DESKTOP_GAME'),
  ('Unity', 'DESKTOP_GAME'),
  ('Unreal', 'DESKTOP_GAME'),
  ('VB.NET', 'DESKTOP_GAME'),
  ('Visual Basic', 'DESKTOP_GAME'),
  ('Visual C++', 'DESKTOP_GAME'),
  ('WPF', 'DESKTOP_GAME'),

  -- Blockchain
  ('Smart Contract', 'BLOCKCHAIN'),
  ('Solidity', 'BLOCKCHAIN'),

  -- GIS
  ('ArcGIS', 'GIS'),
  ('QGIS', 'GIS')
ON DUPLICATE KEY UPDATE
  category = VALUES(category);

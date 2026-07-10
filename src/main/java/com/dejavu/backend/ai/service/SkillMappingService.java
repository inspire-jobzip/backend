package com.dejavu.backend.ai.service;

import com.dejavu.backend.ai.domain.JobNoticeSnapshot;
import com.dejavu.backend.ai.domain.SkillMatch;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

@Service
public class SkillMappingService {

    private static final List<SkillDefinition> SKILLS = List.of(
            skill("React", "FRONTEND", "React", "ReactJS", "React.js"),
            skill("Vue.js", "FRONTEND", "Vue.js", "Vue", "VueJS"),
            skill("Angular", "FRONTEND", "Angular"),
            skill("JavaScript", "FRONTEND", "JavaScript", "ECMAScript", "JS"),
            skill("TypeScript", "FRONTEND", "TypeScript", "TS"),
            skill("HTML", "FRONTEND", "HTML", "HTML5"),
            skill("CSS", "FRONTEND", "CSS", "CSS3"),
            skill("jQuery", "FRONTEND", "jQuery"),
            skill("Ajax", "FRONTEND", "Ajax", "AJAX"),
            skill("Bootstrap", "FRONTEND", "Bootstrap"),
            skill("Redux", "FRONTEND", "Redux"),
            skill("Webpack", "FRONTEND", "Webpack"),
            skill("WebGL", "FRONTEND", "WebGL"),

            skill("Java", "BACKEND", "Java"),
            skill("Spring", "BACKEND", "Spring"),
            skill("Spring Boot", "BACKEND", "Spring Boot", "SpringBoot"),
            skill("JPA", "BACKEND", "JPA"),
            skill("MyBatis", "BACKEND", "MyBatis", "iBATIS"),
            skill("JSP", "BACKEND", "JSP"),
            skill("Servlet", "BACKEND", "Servlet"),
            skill("Node.js", "BACKEND", "Node.js", "NodeJS", "Node"),
            skill("REST API", "BACKEND", "REST API", "RestAPI", "RESTful API"),
            skill("GraphQL", "BACKEND", "GraphQL"),
            skill("Django", "BACKEND", "Django"),
            skill("Flask", "BACKEND", "Flask"),
            skill("ASP.NET", "BACKEND", "ASP.NET"),
            skill("PHP", "BACKEND", "PHP"),
            skill("Ruby", "BACKEND", "Ruby"),
            skill("Go", "BACKEND", "Go", "GoLang"),

            skill("MySQL", "DATABASE", "MySQL"),
            skill("MariaDB", "DATABASE", "MariaDB"),
            skill("PostgreSQL", "DATABASE", "PostgreSQL"),
            skill("OracleDB", "DATABASE", "OracleDB", "Oracle"),
            skill("MSSQL", "DATABASE", "MSSQL", "SQL Server"),
            skill("MongoDB", "DATABASE", "MongoDB"),
            skill("Redis", "DATABASE", "Redis"),
            skill("SQL", "DATABASE", "SQL"),
            skill("NoSQL", "DATABASE", "NoSQL"),

            skill("AWS", "DEVOPS", "AWS"),
            skill("Azure", "DEVOPS", "Azure"),
            skill("GCP", "DEVOPS", "GCP"),
            skill("Docker", "DEVOPS", "Docker"),
            skill("Kubernetes", "DEVOPS", "Kubernetes", "K8s"),
            skill("Jenkins", "DEVOPS", "Jenkins"),
            skill("Git", "DEVOPS", "Git"),
            skill("Linux", "DEVOPS", "Linux"),
            skill("Ubuntu", "DEVOPS", "Ubuntu"),
            skill("CentOS", "DEVOPS", "CentOS"),
            skill("Apache", "DEVOPS", "Apache"),
            skill("Maven", "DEVOPS", "Maven"),

            skill("Android", "MOBILE", "Android"),
            skill("Kotlin", "MOBILE", "Kotlin"),
            skill("iOS", "MOBILE", "iOS"),
            skill("Swift", "MOBILE", "Swift"),
            skill("Flutter", "MOBILE", "Flutter"),
            skill("React Native", "MOBILE", "React Native", "React-Native"),

            skill("Python", "DATA_AI", "Python"),
            skill("Kafka", "DATA_AI", "Kafka"),
            skill("Hadoop", "DATA_AI", "Hadoop"),
            skill("Spark", "DATA_AI", "Spark"),
            skill("Pandas", "DATA_AI", "Pandas"),
            skill("PyTorch", "DATA_AI", "PyTorch"),
            skill("TensorFlow", "DATA_AI", "TensorFlow"),
            skill("Keras", "DATA_AI", "Keras"),
            skill("OpenCV", "DATA_AI", "OpenCV"),
            skill("R", "DATA_AI", "R"),

            skill("C", "EMBEDDED", "C언어"),
            skill("C++", "EMBEDDED", "C++"),
            skill("Embedded Linux", "EMBEDDED", "임베디드리눅스", "Embedded Linux"),
            skill("Arduino", "EMBEDDED", "아두이노", "Arduino"),
            skill("Raspberry Pi", "EMBEDDED", "라즈베리파이", "Raspberry Pi"),
            skill("Verilog", "EMBEDDED", "Verilog"),

            skill("C#", "DESKTOP_GAME", "C#"),
            skill(".NET", "DESKTOP_GAME", ".NET"),
            skill("WPF", "DESKTOP_GAME", "WPF"),
            skill("Unity", "DESKTOP_GAME", "Unity"),
            skill("Unreal", "DESKTOP_GAME", "Unreal", "Unreal Engine"),
            skill("OpenGL", "DESKTOP_GAME", "OpenGL"),
            skill("DirectX", "DESKTOP_GAME", "DirectX"),

            skill("Solidity", "BLOCKCHAIN", "Solidity"),
            skill("Smart Contract", "BLOCKCHAIN", "스마트컨트랙트", "Smart Contract"),
            skill("ArcGIS", "GIS", "ArcGIS"),
            skill("QGIS", "GIS", "QGIS")
    );

    public List<SkillMatch> mapJobSkills(JobNoticeSnapshot jobNotice) {
        String text = String.join(" ",
                nullToBlank(jobNotice.title()),
                nullToBlank(jobNotice.descriptionRaw()),
                String.join(" ", nullSafe(jobNotice.keywords()))
        );
        return mapText(text);
    }

    public List<String> normalizeSkillNames(List<String> skillNames) {
        Set<String> result = new LinkedHashSet<>();
        for (String skillName : nullSafe(skillNames)) {
            findByText(skillName).stream()
                    .map(SkillMatch::skillName)
                    .forEach(result::add);
        }
        return new ArrayList<>(result);
    }

    private List<SkillMatch> mapText(String text) {
        Set<String> seen = new LinkedHashSet<>();
        List<SkillMatch> result = new ArrayList<>();
        String normalizedText = text.toLowerCase(Locale.ROOT);

        for (SkillDefinition skill : SKILLS) {
            boolean matched = skill.aliases().stream()
                    .anyMatch(alias -> containsTerm(normalizedText, alias.toLowerCase(Locale.ROOT)));
            if (matched && seen.add(skill.skillName())) {
                result.add(new SkillMatch(skill.skillName(), skill.category()));
            }
        }
        return result;
    }

    private List<SkillMatch> findByText(String text) {
        return mapText(nullToBlank(text));
    }

    private boolean containsTerm(String text, String term) {
        if (term.matches(".*[가-힣].*")) {
            return text.contains(term);
        }

        String boundary = "(?<![a-z0-9+#.])" + Pattern.quote(term) + "(?![a-z0-9+#.])";
        return Pattern.compile(boundary).matcher(text).find();
    }

    private static SkillDefinition skill(String skillName, String category, String... aliases) {
        return new SkillDefinition(skillName, category, List.of(aliases));
    }

    private List<String> nullSafe(List<String> values) {
        return values == null ? List.of() : values;
    }

    private String nullToBlank(String value) {
        return value == null ? "" : value;
    }

    private record SkillDefinition(
            String skillName,
            String category,
            List<String> aliases
    ) {
    }
}

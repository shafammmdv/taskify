package com.taskify.utility;

import com.taskify.exception.InvalidModelException;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import static com.taskify.utility.MessageConstant.INVALID_DATE_TIME_FORMAT_MSG;

@Component
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class CustomFormatter {

    public static LocalDateTime stringToLocalDateTime(String value) {
        try {
            return LocalDateTime.parse(value, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        } catch (DateTimeParseException exception) {
            throw new InvalidModelException(INVALID_DATE_TIME_FORMAT_MSG);
        }
    }

}

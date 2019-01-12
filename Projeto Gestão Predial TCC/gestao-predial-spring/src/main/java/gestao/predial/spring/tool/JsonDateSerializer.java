package gestao.predial.spring.tool;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;

import org.codehaus.jackson.JsonProcessingException;

import org.codehaus.jackson.map.JsonSerializer;

import org.codehaus.jackson.map.SerializerProvider;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

/**
 * 
 * Used to serialize Java.util.Date, which is not a common JSON
 * 
 * type, so we have to create a custom serialize method;.
 *
 * 
 * 
 * @author Loiane Groner
 * 
 *         http://loianegroner.com (English)
 * 
 *         http://loiane.com (Portuguese)
 * 
 */

@Component

public class JsonDateSerializer extends JsonDeserializer<Date> {

    @Override
    public Date deserialize(JsonParser jsonparser,
            DeserializationContext deserializationcontext) throws IOException, JsonProcessingException {

        SimpleDateFormat f = new SimpleDateFormat("dd.MM.yyyy"); // german date
        String d = jsonparser.getText();
        try {
            return f.parse(d);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

    }

}

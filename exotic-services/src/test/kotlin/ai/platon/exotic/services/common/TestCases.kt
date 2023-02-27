package ai.platon.exotic.services.common

import ai.platon.exotic.services.api.entity.converters.ModelConverter
import org.bson.types.ObjectId
import org.junit.jupiter.api.Test
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.temporal.ChronoUnit
import kotlin.test.assertEquals

class TestCases {

    @Test
    fun testObjectId() {
        val id = "6298b10ccc253e44baca3f5e"
        val objectId = ObjectId(id)
//        println(objectId.timestamp)
//        println(objectId.date)
//        println(Instant.ofEpochSecond(objectId.timestamp.toLong()))

        assertEquals(1654173964, objectId.timestamp)
        assertEquals("Thu Jun 02 09:46:04 BRT 2022", objectId.date.toString())
        assertEquals("2022-06-02T12:46:04Z", Instant.ofEpochSecond(objectId.timestamp.toLong()).toString())
    }

    @Test
    fun testDateTime() {
        val dateTime = LocalDateTime.ofInstant(Instant.EPOCH, ZoneId.systemDefault())
        println(dateTime)
        println(LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS))
        println(ZoneId.systemDefault())
        println(LocalDateTime.parse("2200-01-01T08:00"))

        println(Instant.now())
    }

    @Test
    fun testUnderline() {
        val converter = ModelConverter()
        println(converter.underlineStyle("aGoodName"))
        println(converter.underlineStyle("a_Good_Name"))
    }

    @Test
    fun testRange() {
        println(IntRange(100, 100))
        IntRange(100, 100).forEach {
            println(it)
        }
    }

//    @Test // "Vulnerable API Usage"
//    fun testCron() {
//        val cronDefinition = CronDefinitionBuilder.instanceDefinitionFor(CronType.QUARTZ)
//        val parser = CronParser(cronDefinition)
//        val quartzCron: Cron = parser.parse("0 0 * * * ?")
//        quartzCron.validate()
//        println(quartzCron.asString())
//    }
}

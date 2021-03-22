var curDate = new Date()

var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Set", "Oct", "Nov", "Dec"]
var monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

var week_inc = curDate.getDay()
var day_inc = curDate.getDate()
var month_inc = curDate.getMonth()
var year_inc = curDate.getFullYear()

var w_code = ""
var d_code = ""
var s_code = ""
var ss_code = ""

var year_status = false
week_inc += 6
day_inc += 7

var doctor_id = 2

$(document).ready(function(){
    $("#previous").click(function(){
        $("#dayofweek").html("")
        $("#eachday").html("")
        $("#calendar_content").html("")
        
        week_inc -= 6
        week_inc += 7

        if(day_inc > 12) day_inc -= 12
        else{
            month_inc--
            if(month_inc < 0){
                month_inc = 11
                year_inc--
            } 
            day_inc = monthDays[month_inc] - (12-day_inc)
        } 

        
        var start_date, end_date

        var dis_year, dis_month, dis_day;

        dis_year = year_inc
        dis_month = month_inc+1
        dis_day = day_inc
        end_dis_day = ((dis_day+5)%monthDays[month_inc])==0?monthDays[month_inc]:(dis_day+5)%monthDays[month_inc]
        end_dis_month = ((dis_month+1)%12)==0?(dis_month+1):((dis_month+1)%12)
        end_dis_year = dis_year+1

        start_date = dis_year + '-' + dis_month + '-' + dis_day

        if(dis_day > end_dis_day)
            end_date = dis_year + '-' + end_dis_month + '-' + end_dis_day
        else
            end_date = dis_year + '-' + dis_month + '-' + end_dis_day

        if(dis_month > end_dis_month && dis_day > end_dis_day)
            end_date = end_dis_year + '-' + end_dis_month + '-' + end_dis_day


        var start_date_str = "", end_date_str = ""
        
        var m_year, m_month, m_day

        var rlt_start_date, rlt_end_date

        start_date_str = start_date.split('-')
        end_date_str = end_date.split('-')

        m_year = Number(start_date_str[0])
        m_month = Number(start_date_str[1])
        m_day = Number(start_date_str[2])

        rlt_start_date = m_year + '-' + (m_month<10?('0'+m_month):m_month) + '-' + (m_day<10?('0'+m_day):m_day)

        m_year = Number(end_date_str[0])
        m_month = Number(end_date_str[1])
        m_day = Number(end_date_str[2])

        rlt_end_date = m_year + '-' + (m_month<10?('0'+m_month):m_month) + '-' + (m_day<10?('0'+m_day):m_day)

        $.ajax({
            url: 'fetchdata.php',
            type: 'GET',
            data: {'doctor_id': doctor_id, 'start_date':rlt_start_date, 'end_date':rlt_end_date },
            dataType: 'json',
            success: function(data) {

                console.log(data)
                var max_length = data['max']
                var fetchdata = new Array()
                var time = new Array()
                var date = new Array()

                if(data['res'] != "empty"){
                    for(let row in data['res']){
                        fetchdata = data['res'][row].split('/')
                        time.push(fetchdata[1])
                        date.push(fetchdata[0])
                    }
                }
                
                var e_day = new Array()
                var e_time = new Array()
                if(date.length > 0){
                    for(let i = 0; i < date.length; i++){
                        var tmp_date = date[i].split('-')
                        var tmp_time = time[i].split(' ')
                        e_day.push(tmp_date[2])
                        e_time.push(tmp_time[0])
                    }

                    var time_count = 0;
                    for(let i = week_inc-6; i < week_inc; i++){
                        w_code += "<div>" + days[i%7] + "</div>"
                        if(day_inc > monthDays[month_inc]){
                            day_inc = 1
                            month_inc++
                            if(month_inc > 11){
                                month_inc = 0
                            }
                        }
    
                        d_code += "<div>" + months[month_inc] + " " + day_inc++ + "</div>"
                    
                        for(let j = 0; j < max_length; j++){
                            if(e_day[time_count] != (day_inc-1)){
                                ss_code += "<div>-</div>"
                            }else{
                                ss_code += "<div class='active'>" + e_time[time_count] + "</div>"
                                time_count++
                            }
                        }
                        s_code += "<div>" + ss_code + "</div>"
                        ss_code = ""
                    }
                }else{
                    for(let i = week_inc-6; i < week_inc; i++){
                        w_code += "<div>" + days[i%7] + "</div>"
                        if(day_inc > monthDays[month_inc]){
                            day_inc = 1
                            month_inc++
                            if(month_inc > 11){
                                month_inc = 0
                                year_status = true
                            }
                        }
    
                        d_code += "<div>" + months[month_inc] + " " + day_inc++ + "</div>"
                        for(let j = 0; j < 4; j++){
                            ss_code += "<div>-</div>"
                        }

                        s_code += "<div>" + ss_code + "</div>"
                        ss_code = ""
                    }
                }

                if(year_status) {
                    month_inc = 12
                    year_status = false
                }
                
                $("#dayofweek").html(w_code)
                $("#eachday").html(d_code)
                $("#calendar_content").html(s_code)
                w_code = ""
                d_code = ""
                s_code = ""
            }
        })
    })

    $("#next").click(function(){
        $("#dayofweek").html("")
        $("#eachday").html("")
        $("#calendar_content").html("")
        
        var start_date, end_date

        var dis_year, dis_month, dis_day;

        dis_year = year_inc
        dis_month = month_inc+1
        dis_day = (day_inc%monthDays[month_inc])==0?monthDays[month_inc]:(day_inc%monthDays[month_inc])
        end_dis_day = ((dis_day+6)%monthDays[month_inc])==0?monthDays[month_inc]:(dis_day+5)%monthDays[month_inc]
        end_dis_month = ((dis_month+1)%12)==0?(dis_month+1):((dis_month+1)%12)
        end_dis_year = dis_year+1

        
        if(end_dis_day == 7){
            start_date = dis_year + '-' + end_dis_month + '-' + dis_day
            end_date = dis_year + '-' + end_dis_month + '-' + end_dis_day
        }else{
            start_date = dis_year + '-' + dis_month + '-' + dis_day
        }

        if(dis_day > end_dis_day)
            end_date = dis_year + '-' + end_dis_month + '-' + end_dis_day
        else{
            if(end_dis_day == 7)
                end_date = dis_year + '-' + end_dis_month + '-' + end_dis_day
            else
                end_date = dis_year + '-' + dis_month + '-' + end_dis_day
        }

        if(dis_month > end_dis_month && dis_day > end_dis_day)
            end_date = end_dis_year + '-' + end_dis_month + '-' + end_dis_day

                var start_date_str = "", end_date_str = ""
        
        var m_year, m_month, m_day

        var rlt_start_date, rlt_end_date

        start_date_str = start_date.split('-')
        end_date_str = end_date.split('-')

        m_year = Number(start_date_str[0])
        m_month = Number(start_date_str[1])
        m_day = Number(start_date_str[2])

        rlt_start_date = m_year + '-' + (m_month<10?('0'+m_month):m_month) + '-' + (m_day<10?('0'+m_day):m_day)

        m_year = Number(end_date_str[0])
        m_month = Number(end_date_str[1])
        m_day = Number(end_date_str[2])

        rlt_end_date = m_year + '-' + (m_month<10?('0'+m_month):m_month) + '-' + (m_day<10?('0'+m_day):m_day)

        week_inc += 6

        $.ajax({
            url: 'fetchdata.php',
            type: 'GET',
            data: {'doctor_id': doctor_id, 'start_date':rlt_start_date, 'end_date':rlt_end_date },
            dataType: 'json',
            success: function(data) {

                console.log(data)
                var max_length = data['max']
                var fetchdata = new Array()
                var time = new Array()
                var date = new Array()

                if(data['res'] != "empty"){
                    for(let row in data['res']){
                        fetchdata = data['res'][row].split('/')
                        time.push(fetchdata[1])
                        date.push(fetchdata[0])
                    }
                }
                
                var e_day = new Array()
                var e_time = new Array()
                if(date.length > 0){
                    for(let i = 0; i < date.length; i++){
                        var tmp_date = date[i].split('-')
                        var tmp_time = time[i].split(' ')
                        e_day.push(tmp_date[2])
                        e_time.push(tmp_time[0])
                    }

                    var time_count = 0;

                    for(let i = week_inc-6; i < week_inc; i++){
                        w_code += "<div>" + days[i%7] + "</div>"
                        if(day_inc > monthDays[month_inc]){
                            day_inc = 1
                            month_inc++
                            if(month_inc > 11){
                                year_inc++
                                month_inc = 0
                            }
                        }
    
                        d_code += "<div>" + months[month_inc] + " " + day_inc++ + "</div>"
                    
                        for(let j = 0; j < max_length; j++){
                            if(e_day[time_count] != (day_inc-1)){
                                ss_code += "<div>-</div>"
                            }else{
                                ss_code += "<div class='active'>" + e_time[time_count] + "</div>"
                                time_count++
                            }
                        }
                        s_code += "<div>" + ss_code + "</div>"
                        ss_code = ""
                    }
                }else{
                    for(let i = week_inc-6; i < week_inc; i++){
                        w_code += "<div>" + days[i%7] + "</div>"
                        if(day_inc > monthDays[month_inc]){
                            day_inc = 1
                            month_inc++
                            if(month_inc > 11){
                                year_inc++
                                month_inc = 0
                            }
                        }
    
                        d_code += "<div>" + months[month_inc] + " " + day_inc++ + "</div>"
                        for(let j = 0; j < 4; j++){
                            ss_code += "<div>-</div>"
                        }

                        s_code += "<div>" + ss_code + "</div>"
                        ss_code = ""
                    }
                }

                if(year_status) {
                    month_inc = 12
                    year_status = false
                }
                
                $("#dayofweek").html(w_code)
                $("#eachday").html(d_code)
                $("#calendar_content").html(s_code)
                // $("#calendar_content").css('')
                w_code = ""
                d_code = ""
                s_code = ""
            }
        })
    })
})

function init(){
    $("#dayofweek").html("")
    $("#eachday").html("")
    $("#calendar_content").html("")
    
    var start_date, end_date

    var dis_year, dis_month, dis_day;

    dis_year = year_inc
    dis_month = month_inc+1
    dis_day = (day_inc%monthDays[month_inc])==0?monthDays[month_inc]:(day_inc%monthDays[month_inc])
    end_dis_day = ((dis_day+6)%monthDays[month_inc])==0?monthDays[month_inc]:(dis_day+5)%monthDays[month_inc]
    end_dis_month = ((dis_month+1)%12)==0?(dis_month+1):((dis_month+1)%12)
    end_dis_year = dis_year+1

    
    if(end_dis_day == 7){
        start_date = dis_year + '-' + end_dis_month + '-' + dis_day
        end_date = dis_year + '-' + end_dis_month + '-' + end_dis_day
    }else{
        start_date = dis_year + '-' + dis_month + '-' + dis_day
    }

    if(dis_day > end_dis_day)
        end_date = dis_year + '-' + end_dis_month + '-' + end_dis_day
    else{
        if(end_dis_day == 7)
            end_date = dis_year + '-' + end_dis_month + '-' + end_dis_day
        else
            end_date = dis_year + '-' + dis_month + '-' + end_dis_day
    }

    if(dis_month > end_dis_month && dis_day > end_dis_day)
        end_date = end_dis_year + '-' + end_dis_month + '-' + end_dis_day

            var start_date_str = "", end_date_str = ""
    
    var m_year, m_month, m_day

    var rlt_start_date, rlt_end_date

    start_date_str = start_date.split('-')
    end_date_str = end_date.split('-')

    m_year = Number(start_date_str[0])
    m_month = Number(start_date_str[1])
    m_day = Number(start_date_str[2])

    rlt_start_date = m_year + '-' + (m_month<10?('0'+m_month):m_month) + '-' + (m_day<10?('0'+m_day):m_day)

    m_year = Number(end_date_str[0])
    m_month = Number(end_date_str[1])
    m_day = Number(end_date_str[2])

    rlt_end_date = m_year + '-' + (m_month<10?('0'+m_month):m_month) + '-' + (m_day<10?('0'+m_day):m_day)

    $.ajax({
        url: 'fetchdata.php',
        type: 'GET',
        data: {'doctor_id': doctor_id, 'start_date':rlt_start_date, 'end_date':rlt_end_date },
        dataType: 'json',
        success: function(data) {

            console.log(data)
            var max_length = data['max']
            var fetchdata = new Array()
            var time = new Array()
            var date = new Array()

            if(data['res'] != "empty"){
                for(let row in data['res']){
                    fetchdata = data['res'][row].split('/')
                    time.push(fetchdata[1])
                    date.push(fetchdata[0])
                }
            }
            
            var e_day = new Array()
            var e_time = new Array()
            if(date.length > 0){
                for(let i = 0; i < date.length; i++){
                    var tmp_date = date[i].split('-')
                    var tmp_time = time[i].split(' ')
                    e_day.push(tmp_date[2])
                    e_time.push(tmp_time[0])
                }

                var time_count = 0;

                for(let i = week_inc-6; i < week_inc; i++){
                    w_code += "<div>" + days[i%7] + "</div>"
                    if(day_inc > monthDays[month_inc]){
                        day_inc = 1
                        month_inc++
                        if(month_inc > 11){
                            year_inc++
                            month_inc = 0
                        }
                    }

                    d_code += "<div>" + months[month_inc] + " " + day_inc++ + "</div>"
                
                    for(let j = 0; j < max_length; j++){
                        if(e_day[time_count] != (day_inc-1)){
                            ss_code += "<div>-</div>"
                        }else{
                            ss_code += "<div class='active'>" + e_time[time_count] + "</div>"
                            time_count++
                        }
                    }
                    s_code += "<div>" + ss_code + "</div>"
                    ss_code = ""
                }
            }else{
                for(let i = week_inc-6; i < week_inc; i++){
                    w_code += "<div>" + days[i%7] + "</div>"
                    if(day_inc > monthDays[month_inc]){
                        day_inc = 1
                        month_inc++
                        if(month_inc > 11){
                            year_inc++
                            month_inc = 0
                        }
                    }

                    d_code += "<div>" + months[month_inc] + " " + day_inc++ + "</div>"
                    for(let j = 0; j < 4; j++){
                        ss_code += "<div>-</div>"
                    }

                    s_code += "<div>" + ss_code + "</div>"
                    ss_code = ""
                }
            }

            if(year_status) {
                month_inc = 12
                year_status = false
            }
            
            $("#dayofweek").html(w_code)
            $("#eachday").html(d_code)
            $("#calendar_content").html(s_code)
            w_code = ""
            d_code = ""
            s_code = ""
        }
    })
}
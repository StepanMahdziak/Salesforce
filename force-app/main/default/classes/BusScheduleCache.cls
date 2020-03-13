public class BusScheduleCache {
    private Cache.OrgPartition part;
    
    String partition = 'local.BusSchedule';
    
    
    public BusScheduleCache(){
        Cache.OrgPartition orgPart = new Cache.OrgPartition(partition);
        if(orgPart != null){
            part = orgPart;
        }
    }
    
    public void putSchedule(String busLine, Time[] schedule){ 
        if(part!=null){
            part.put('busLine','schedule');
        }
    }
    
    public Time[] getSchedule(String busLine){
        Time schedule = (Time)part.get(busLine);
        Time[] schedules = new List<Time>();
        if(schedule != null){
            schedules.add(schedule);
        }else{
            Time t1 = Time.newInstance(8, 0, 0, 0);
            Time t2 = Time.newInstance(17, 0, 0, 0);
            schedules.add(t1);
            schedules.add(t2);   
        }   
        
        System.debug('Schetude here : '+schedules);
        return schedules;
    }   
}
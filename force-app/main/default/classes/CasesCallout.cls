public with sharing class CasesCallout {
    @AuraEnabled
    public static Object getCases(String caseId){
        String endPoint = 'callout:ForZerefOrg/services/apexrest/Cases';
        //String sessionID = 'ASAAQMw_5J3qhUQWaPJxcxO7cH1iMjxUlSCmU2A5fGHR0mwKWqGZe.gGdWGydKN.sfFWTEs3nnsMD8IJShvw2H9hXIa0JIyi';
        Http h2 = new Http();
        HttpRequest req1 = new HttpRequest();
        
        req1.setEndpoint(endPoint);
        req1.setMethod('GET');
        /*req1.setHeader('Authorization','Bearer ' + sessionID);*/
        
        HttpResponse res1 = h2.send(req1);
        if(res1.getStatusCode() == 200){
            // System.debug(res1.getBody());
                    List<Object> results = (List<Object>)JSON.deserializeUntyped(res1.getBody());
            for(Object result : results){
                Map<String, Object> caseProps = (Map<String, Object>) result;
                System.debug('Case Number'+caseProps.get('CaseNumber')+' - Subject'+caseProps.get('Subject'));
                if(caseId == caseProps.get('CaseNumber'))
                    return result;
            }
            return '';
        }
        return '';
    }
}

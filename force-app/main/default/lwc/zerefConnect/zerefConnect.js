import { LightningElement } from 'lwc';
import getCases from '@salesforce/apex/CasesCallout.getCases';

export default class ZerefConnect extends LightningElement {
    isModalOpen=false;
    caseId;
    case;

    handleModal(){

        this.isModalOpen = true;
    }
    handleClick(){
        // getCases(caseId).then(res => {
        //     console.log(res);
            
        //     console.log(JSON.parse(res).message);
        // })
        this.isModalOpen = false;
        this.case = JSON.parse(JSON.stringify(getCases(caseId)));
        console.log(this.case);
    }
    changeHandler(event){
        this.caseId = event.target.value;
        console.log(this.caseId);
    }
    closeModal(){
        this.isModalOpen = false;
        }
}
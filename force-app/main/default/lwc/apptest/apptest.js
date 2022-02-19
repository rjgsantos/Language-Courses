import { LightningElement } from 'lwc';

export default class Apptest extends LightningElement {
    name = '';
    description = '';
    category = '';
    material = '';
    price = '';
    pictureUrl = 'https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg';
    ready = false;

    connectedCallback(){
        setTimeout(() => {
            this.ready = true;
        },3000);
    }
}
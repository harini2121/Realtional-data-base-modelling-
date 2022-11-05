# Realtional-data-base-modelling-
Learning on conceptual data modelling, Relational modelling, Model comparison, Physical implementation in a distributed environment 



SonicLive Case Study 

 
SonicLive is a UK company that is specialised in hiring out audio equipment to recording artists to be used for the recording, mixing and mastering of music projects such as music tracks and albums. The company is based on 12 recording studios located all over the UK, including 4 in London. SonicLife offers a really wide range of studio equipment to their customers such as analogue and digital recorders, mixing desks, audio interfaces, microphones, studio monitors, digital converters, controllers and other miscellaneous studio accessories.  

 

The members of staff, who work in the SonicLive studios, include studio managers, drivers and sound engineers but some members of staff can be allocated to more than one studio. Every studio is assigned a studio manager. The role of the studio manager is to ensure the smooth day-to-day running of the studio that he/she is responsible for. The job of the drivers is to guarantee the safe transportation of equipment and for this purpose each driver is given a van and these vans are under the responsibility of the drivers they are given to and not shared among drivers. A record of which piece of equipment is transported by which driver needs to be kept. It is to be observed that vans can be out of service for certain periods of time, sometimes for quite a while, and are thus not used by any drivers during these times. The role of the sound engineers is to ensure that customers are provided with the right type of equipment for the music work that they want to do and that they can use it appropriately to get the best value out of it. Each engineer oversees a certain number of customers so that to ensure that all the customers have a first point-of-call in case they have any problems and thus to make sure that they receive the best possible customer service at all times. In addition, each engineer is responsible for a certain number of pieces of equipment which they need to closely look after in order to make sure that they are in pristine condition. To this effect, all pieces of equipment must be maintained regularly. At regular intervals or on specific dates, all pieces of equipments need to be serviced by the sound engineers who know how to fix them or by a whole group of engineers in the case of particularly complex equipment such as, for instance, large mixing desks. Similarly, if a piece of equipment is faulty, it needs to be repaired urgently so that it can be made available to the customers as rapidly as possible. It is also important to note that a piece of equipment is registered under a specific studio’s name so that a record is kept of which studio is ultimately responsible for it.  

 

A distinction is made between two different types of equipment. There is equipment that is fixed, like large mixing desks, digital recorders or audio interfaces, in the way that this equipment cannot leave the studio because of the size and therefore can be used only in the studio under the guidance of a sound engineer. Other pieces of equipment like microphones, converters and other accessories are portable in the sense that they can be taken away by customers to be used anywhere. Because of the highly technical nature of the equipment offered by SonicLive, a customer needs to first place a request for any piece of equipment he/she is willing to hire.  This request needs to specify the start date and the end date of the period of utilisation of a specific piece of equipment, the level of expertise the customer who is going to use it has and a description of the project for which this piece of equipment is going to be used. Once it has been submitted, a SonicLive sound engineer examines the request, finds out about the availability of the required piece of equipment for the required period of utilisation and decides whether to go ahead with hiring out this equipment or not. If the piece of equipment is portable, a Portable Equipment Hiring Agreement is drawn to record when the equipment is to be hired out to the customer, when it is due to be returned, the initial cost of the hiring, whether an additional insurance needs to be subscribed to and the total cost of the hiring including any additional insurance. If the piece of equipment is fixed, i.e. not portable, a Fixed Equipment Hiring Contract is produced to record which piece of equipment is to be used by which customer under the guidance of which engineer, as well as the start and end dates of this utilisation and the cost involved. 



1. Produce a complete Conceptual Entity-Relationship Diagram for SonicLive. This needs to include all the entity types, relationship types, multiplicity constraints, attributes and primary keys that you have previously identified.  


2. Produce a complete Logical Entity-Relationship Diagram for SonicLive using relational model. This needs to include all the relations, attributes, primary keys and foreign keys that you have identified.  
 

3. Compare and contrast the use of RDBMS and ORDBMS to implement the above. 


4. Produce SQL DDL statements to implement the above in both the logical modelling approaches discussed in question 3). 


5. Implement a distributed relational database environment using fragmentation concept preserving fragmentation transparency and location transparency. 

You are expected to distribute fragments (Horizontal / vertical / mixed) of staff relation over multiple sites (two would be enough – remote and local sites) 

You are expected to follow the naming conventions and assign unique names to data items (fragments in this case) 

In order to maintain location transparency, you are required to assign aliases to your fragments. 

Create a database link to establish a connection with the remote site(s) and create a VIEW which preserves fragmentation, location transparency which displays the global staff members distributed across multiple sites. 

(Give evidences of fragmented staff relation distributed across different studio databases and reconstructing of the Complete staff relation using those different fragments.) 

Note: Fragmentation of Staff relation and distributing across different studio databases is required.  


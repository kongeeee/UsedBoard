ClassicEditor 

    .create( document.querySelector( бо#content' ) ) 

    .then( editor => { 

        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );
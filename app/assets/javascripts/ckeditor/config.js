
//Default configuration
// CKEDITOR.editorConfig = function( config )
// {
//     config.toolbar_MyToolbar =
//     [
//         { name: 'document', items : [ 'NewPage','Preview' ] },
//         { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
//         { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
//         { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'
//                  ,'Iframe' ] },
//                 '/',
//         { name: 'styles', items : [ 'Styles','Format' ] },
//         { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
//         { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
//         { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
//         { name: 'tools', items : [ 'Maximize','-','About' ] }
//     ];

// }

// CKEDITOR.replace( 'textarea_id', {
//     allowedContent: 'p b i; a[!href]',
//     on: {
//         instanceReady: function( evt ) {
//             var editor = evt.editor;

//             editor.filter.check( 'h1' ); // -> false
//             editor.setData( '<h1><i>Foo</i></h1><p class="left"><span>Bar</span> <a href="http://foo.bar">foo</a></p>' );
//             // Editor contents will be:
//             '<p><i>Foo</i></p><p>Bar <a href="http://foo.bar">foo</a></p>'
//         }
//     }
// } );

CKEDITOR.editorConfig = function( config )
{
    config.toolbar =
    [
        { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-' ,'Bold','Italic','Strike','-','RemoveFormat','NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote'] },
        { name: 'clipboard', items : [ 'Cut','Copy','PasteText','-','Undo','Redo' ] },
        { name: 'paragraph', items : [ 'Format','Link','Unlink','Anchor','Maximize' ] },
        { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','SpecialChar','PageBreak'] },                
       
    ];
};
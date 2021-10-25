<?php

/**
 * Filename: block_styling.php
 * Description: Outputs inline CSS from SCSS inside PHP for an instance of this block
 * Author: @ryanemitchell
 *
 */


/*  ==========================================================================
	Import ScssPHP
	Ref: https://scssphp.github.io/scssphp/
	========================================================================== */

use ScssPhp\ScssPhp\Compiler;
global $witcom_breakpoint_md;
/*  ==========================================================================
	Get Wit Commander fields and set vars
	========================================================================== */



/*  ==========================================================================
	Get ACF Values for SCSS
	========================================================================== */

/* === Layout ==== */

if ( get_field( '[blockUnderSlug]_wrapper_padding' ) ) :
	$[blockUnderSlug]_wrapper_padding = get_field( '[blockUnderSlug]_wrapper_padding' ) . "px";
else :
	$[blockUnderSlug]_wrapper_padding = '0';
endif;


/* ===  ACF Fields to Variables === */

if ( get_field( '[blockUnderSlug]_desktop_background_color' ) ) :
	$[blockUnderSlug]_desktop_background_color = get_field( '[blockUnderSlug]_desktop_background_color' );
else :
	$[blockUnderSlug]_desktop_background_color = '#CCFF00';
endif;



if ( get_field( '[blockUnderSlug]_mobile_background_color' ) ) :
	$[blockUnderSlug]_mobile_background_color = get_field( '[blockUnderSlug]_mobile_background_color' );
else :
	$[blockUnderSlug]_mobile_background_color = '#FF00CC';
endif;


/* === Additional SCSS === */

if ( get_field( '[blockUnderSlug]_additional_scss' ) ) :
	$[blockUnderSlug]_additional_scss = get_field( '[blockUnderSlug]_additional_scss' );
else :
	$[blockUnderSlug]_additional_scss = '';
endif;


/*  ==========================================================================
	Create Block Dynamic SCSS
	========================================================================== */

$[blockUnderSlug]_scss = /** @lang SCSS */
	"

            #$blockID {
         
               .[blockCamelSlug] {
               
	               &_wrapper {
	                 background-color: $[blockUnderSlug]_mobile_background_color;
	                 padding: $[blockUnderSlug]_wrapper_padding;
	               
		                @media (min-width: $witcom_breakpoint_md) {
		                  background-color: $[blockUnderSlug]_desktop_background_color;
		                } //end medium breakpoint
	               
	               }

					&_inner {
	                 display: flex;
	                 flex-direction: column;
					 align-items: center;
	                 justify-items: center; 
	               
	               }
               
               }
               
				/* ===========================  Styling for in the editor ONLY  ========================== */
               
				@at-root {
				  .wp-admin {
				    #$blockID {
				      border: 1px solid red;
				    }
				  }
				}

               /* ===========================  End editor ONLY Styling ========================== */
               

               $[blockUnderSlug]_additional_scss

            } /* End of .$blockID */

       ";  // end $witcom_split_content_scss


/*  ==========================================================================
	Compile SCSS
	========================================================================== */

$scss = new Compiler();

// Option to Crunch SCSS from Wit Commander Settings
if ( get_field( 'crunch_witcom_scss', 'option' ) ):
	$scss->setFormatter( 'ScssPhp\ScssPhp\Formatter\Crunched' );
else:
//	$scss->setFormatter( 'ScssPhp\ScssPhp\Formatter\Expanded' );

// Override Wit Commander
	$scss->setFormatter( 'ScssPhp\ScssPhp\Formatter\Crunched' );
endif;


$compiledCssCode = $scss->compile( $[blockUnderSlug]_scss );

/*  ==========================================================================
	Write CSS to the browser
	========================================================================== */

echo( "<style id='$blockID-style'>\r\n" );
echo $compiledCssCode;
echo( '</style>' );

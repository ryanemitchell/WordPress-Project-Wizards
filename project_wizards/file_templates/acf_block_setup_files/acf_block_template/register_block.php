<?php
/** @noinspection ALL*/
/**
 * Filename: [blockSlug]/register_block.php
 * Description: Register the [blockName] Block
 * Author: [blockAuthor]
 */

// Load the ACF Fields for this block
include_once 'lib/acf-fields.php';


/*  ==========================================================================
	Register Block
	Ref: https://www.advancedcustomfields.com/resources/acf_register_block_type/
	========================================================================== */

/**
 *  Register ACF block: [blockName]
 *  ACF/[blockSlug]
 *
 */
function [blockUnderSlug]_register_blocks() {

	if ( ! function_exists( 'acf_register_block_type' ) ) {
		return;
	}

	acf_register_block_type( array(
		'name'            => '[blockUnderSlug]',
		'title'           => __( '[blockName]' ),
		'render_template' => plugin_dir_path( __FILE__ ) . 'views/render_template.php',
		'category'        => '[blockCategory]',
		'icon'            => file_get_contents( plugin_dir_path( __FILE__ ) . '/assets/icon.svg' ),
		'align'           => 'center',
		'mode'            => 'preview',
		'keywords'        => array( '', '', '' ),
		'supports'        => array(
			'mode'     => true,
			'align'    => array( 'wide', 'full', 'center' ),
			'multiple' => true,
		)
	) );
}

add_action( 'acf/init', '[blockUnderSlug]_register_blocks' );

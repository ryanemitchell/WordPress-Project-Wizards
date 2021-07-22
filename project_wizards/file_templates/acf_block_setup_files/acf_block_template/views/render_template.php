<?php

/*  ==========================================================================
    * Filename: render_template.php
    * Description: Front end for the [blockName] block
    * Author: [blockAuthor]
    *

    [Table of contents]

    1. Define block specific Vars
    2. Include block specific styling
    3. Create the hooks for this view
    4. Get ACF Values for Content
    5. Render the front end
    6. Include block specific script

    ========================================================================== */

/* ==========================================================================
	Define block specific Vars
    Build ID and Class names.
   ========================================================================== */

if ( ! empty( $block ) ) {
	//  This instances ID
	$blockID = $block['id'];
	//  The block name
	$blockName = $block['name'];
	// replace forward slash in block name for better compatibility
	$blockName = str_replace( '/', '_', $blockName );
}

// Create class attribute allowing for custom "className" and "align" values.
$className = '[blockClass] ' . $blockName . ' ' . $blockID;
if ( ! empty( $block['className'] ) ) {
	$className .= ' ' . $block['className'];
}
if ( ! empty( $block['align'] ) ) {
	$className .= ' align' . $block['align'];
}

/*  ==========================================================================
	Include block specific styling
	========================================================================== */

include_once 'block_styling.php';

/*  ==========================================================================
    Get ACF Values for Content
    ========================================================================== */

// Get the post ID for getting fields if pulling from a post
//$id = get_the_id();

if ( get_field( 'acf_starter_block_header_content' ) ) :
	$acf_starter_block_header_content = get_field( 'acf_starter_block_header_content' );
else :
	$acf_starter_block_header_content = '';
endif;

if ( get_field( 'acf_starter_block_content' ) ) :
	$acf_starter_block_content = get_field( 'acf_starter_block_content' );
else :
	$acf_starter_block_content = '';
endif;

if ( get_field( 'acf_starter_block_footer_content' ) ) :
	$acf_starter_block_footer_content = get_field( 'acf_starter_block_footer_content' );
else :
	$acf_starter_block_footer_content = '';
endif;

/*  ==========================================================================
    Render the front end
    ========================================================================== */

?>

    <div id="<?php echo $blockID ?>" class="<?php echo esc_attr( $className ); ?>">



        <div class="[blockCamelSlug]_wrapper">

            <div class="[blockCamelSlug]_inner">

				<?php if ( $acf_starter_block_header_content ): ?>
                    <div class="[blockCamelSlug]_heading">

                        <h3><?php echo $acf_starter_block_header_content ?></h3>
                    </div>
				<?php endif; ?>


	            <?php if ( $acf_starter_block_content ): ?>
                    <div class="[blockCamelSlug]_content">
                        <?php echo $acf_starter_block_content ?>
                    </div>
	            <?php endif; ?>


	            <?php if ( $acf_starter_block_footer_content ): ?>
                    <div class="[blockCamelSlug]_footer">
			            <?php echo $acf_starter_block_footer_content ?>
                    </div>
	            <?php endif; ?>

            </div> <!-- End of .[blockCamelSlug]_inner -->

        </div> <!-- End of .[blockCamelSlug]_wrapper -->

    </div> <!-- End of <?php echo esc_attr( $className ); ?> -->

<?php

/*  ==========================================================================
    Include block specific script
    ========================================================================== */

include_once 'block_scripts.php';

?>

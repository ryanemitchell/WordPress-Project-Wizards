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

if ( get_field( '[blockUnderSlug]_header_content' ) ) :
	$[blockUnderSlug]_header_content = get_field( '[blockUnderSlug]_header_content' );
else :
	$[blockUnderSlug]_header_content = '[blockName] Header Section';
endif;

if ( get_field( '[blockUnderSlug]_content' ) ) :
	$[blockUnderSlug]_content = get_field( '[blockUnderSlug]_content' );
else :
	$[blockUnderSlug]_content = '[blockName] Content Section';
endif;

if ( get_field( '[blockUnderSlug]_footer_content' ) ) :
	$[blockUnderSlug]_footer_content = get_field( '[blockUnderSlug]_footer_content' );
else :
	$[blockUnderSlug]_footer_content = '[blockName] Footer Section';
endif;

/*  ==========================================================================
    Define InnerBLocks Template
    ========================================================================== */
$[blockUnderSlug]_template = array(
	array('core/heading', array(
		'level' => 2,
		'placeholder' => 'Title Goes Here',
	)),
	array( 'core/paragraph', array(
		'placeholder' => 'Paragraph Copy',
	) )
);



/*  ==========================================================================
    Render the front end
    ========================================================================== */

?>

    <div id="<?php echo $blockID ?>" class="<?php echo esc_attr( $className ); ?>">



        <div class="[blockCamelSlug]_wrapper">

            <div class="[blockCamelSlug]_inner flex flex-col lg:flex-row justify-between items-center">
                <section class="col1 lg:w-1/2">

                    <div class="innerBlocks">
                        <?php echo '<InnerBlocks template="' . esc_attr( wp_json_encode( $[blockUnderSlug]_template ) ) . '" />';?>
                    </div>

                </section>
                <aside class="col2 flex flex-col lg:px-0 max-w-full lg:w-1/2 self-start">

                    <?php if ( $[blockUnderSlug]_header_content ): ?>
                    <div class="[blockCamelSlug]_heading">

                        <h3><?php echo $[blockUnderSlug]_header_content ?></h3>
                    </div>
	                <?php endif; ?>



	            <?php if ( $[blockUnderSlug]_content ): ?>
                    <div class="[blockCamelSlug]_content">




                        <?php echo $[blockUnderSlug]_content ?>
                    </div>
	            <?php endif; ?>


	            <?php if ( $[blockUnderSlug]_footer_content ): ?>
                    <div class="[blockCamelSlug]_footer">
			            <?php echo $[blockUnderSlug]_footer_content ?>
                    </div>
	            <?php endif; ?>
                </aside>

            </div> <!-- End of .[blockCamelSlug]_inner -->

        </div> <!-- End of .[blockCamelSlug]_wrapper -->

    </div> <!-- End of <?php echo esc_attr( $className ); ?> -->

<?php

/*  ==========================================================================
    Include block specific script
    ========================================================================== */

include_once 'block_scripts.php';

?>

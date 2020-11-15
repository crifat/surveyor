//= require arctic_admin/base

$(document).ready(function () {
    $('form#new_question select#question_survey_id').on('change', function() {
        if(this.value) {
            reloadWithParams('?survey_id=' + this.value);
        }
    });
    let $questionOptionTypeSelect = $('form.question #question_question_type');

    if ($questionOptionTypeSelect) {
        let $nextQuestionParent = $('.next-question-select').parent();
        if($questionOptionTypeSelect.val() != 'single_choice') {
            $nextQuestionParent.hide();
        }

        $questionOptionTypeSelect.on('change', function () {
            if(this.value == 'single_choice') {
                $nextQuestionParent.show();
            } else {
                $nextQuestionParent.hide();
            }
        });
    }


    function reloadWithParams(params) {
        window.location.href = window.location.href.replace( /[\?#].*|$/, params );
    }
});

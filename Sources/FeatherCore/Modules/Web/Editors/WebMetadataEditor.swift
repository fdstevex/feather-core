//
//  File.swift
//
//
//  Created by Tibor Bodecs on 2021. 12. 06..
//

import Vapor

struct WebMetadataEditor: FeatherModelEditor {
    let model: WebMetadataModel
    let form: FeatherForm

    init(model: WebMetadataModel, form: FeatherForm) {
        self.model = model
        self.form = form
    }

    var formFields: [FormComponent] {
        InputField("title")
            .validators {
                FormFieldValidator.required($1)
            }
            .read { $1.output.context.value = model.title }
            .write { model.title = $1.input }
    }
}

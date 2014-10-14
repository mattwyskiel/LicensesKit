// Playground - noun: a place where people can play

import UIKit
import LicensesKit

var styleCSS = "p.license {\n background:grey;\n}\nbody {\nfont-family: sans-serif;\noverflow-wrap:\nbreak-word;\n}\npre {\nbackground-color: #eeeeee;\npadding: 1em;\nwhite-space: pre-wrap;\n}"

let licenseString = LicenseContentFetcher.getContent(filename: "mit_full")

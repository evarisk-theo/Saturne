-- Copyright (C) 2022-2023 EVARISK <technique@evarisk.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see https://www.gnu.org/licenses/.

-- 1.0.0
ALTER TABLE `llx_element_openinghours` ADD `fk_user_modif` INT NULL AFTER `fk_user_creat`;
ALTER TABLE `llx_element_openinghours` RENAME `llx_saturne_schedules`;
ALTER TABLE `llx_saturne_schedules` CHANGE `tms` `tms` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `llx_saturne_schedules` CHANGE `status` `status` INT(11) NOT NULL;

-- 1.1.0
ALTER TABLE `llx_dolisirh_object_signature` ADD module_name VARCHAR(128) NULL AFTER element_type;
UPDATE `llx_dolisirh_object_signature` SET module_name = 'dolisirh';
INSERT INTO `llx_saturne_object_signature` (entity, date_creation, tms, import_key, status, role, firstname, lastname, email, phone, society_name, signature_date, signature_location, signature_comment, element_id, element_type, module_name, signature, stamp, last_email_sent_date, signature_url, transaction_url, object_type, fk_object)
SELECT entity, date_creation, tms, import_key, status, role, firstname, lastname, email, phone, society_name, signature_date, signature_location, signature_comment, element_id, element_type, module_name, signature, stamp, last_email_sent_date, signature_url, transaction_url, object_type, fk_object FROM `llx_dolisirh_object_signature`;
DROP TABLE `llx_dolisirh_object_signature`;

ALTER TABLE `llx_dolismq_dolismqdocuments` ADD module_name VARCHAR(128) NULL AFTER type;
UPDATE `llx_dolismq_dolismqdocuments` SET module_name = 'dolismq';
INSERT INTO `llx_saturne_object_documents` (ref, ref_ext, entity, date_creation, tms, import_key, status, type, module_name, json, model_pdf, model_odt, last_main_doc, parent_type, parent_id, fk_user_creat)
SELECT ref, ref_ext, entity, date_creation, tms, import_key, status, type, module_name, json, model_pdf, model_odt, last_main_doc, parent_type, parent_id, fk_user_creat FROM `llx_dolismq_dolismqdocuments`;
DROP TABLE `llx_dolismq_dolismqdocuments`;
DROP TABLE `llx_dolismq_dolismqdocuments_extrafields`;

ALTER TABLE `llx_dolisirh_dolisirhdocuments` ADD module_name VARCHAR(128) NULL AFTER type;
UPDATE `llx_dolismq_dolismqdocuments` SET module_name = 'dolisirh';
INSERT INTO `llx_saturne_object_documents` (ref, ref_ext, entity, date_creation, tms, import_key, status, type, module_name, json, model_pdf, model_odt, last_main_doc, parent_type, parent_id, fk_user_creat)
SELECT ref, ref_ext, entity, date_creation, tms, import_key, status, type, module_name, json, model_pdf, model_odt, last_main_doc, parent_type, parent_id, fk_user_creat FROM `llx_dolisirh_dolisirhdocuments`;
DROP TABLE `llx_dolisirh_dolisirhdocuments`;
DROP TABLE `llx_dolisirh_dolisirhdocuments_extrafields`;

ALTER TABLE `llx_dolimeet_dolimeetdocuments` ADD module_name VARCHAR(128) NULL AFTER type;
UPDATE `llx_dolimeet_dolimeetdocuments` SET module_name = 'dolimeet';
INSERT INTO `llx_saturne_object_documents` (ref, ref_ext, entity, date_creation, tms, import_key, status, type, module_name, json, model_pdf, model_odt, last_main_doc, parent_type, parent_id, fk_user_creat)
SELECT ref, ref_ext, entity, date_creation, tms, import_key, status, type, module_name, json, model_pdf, model_odt, last_main_doc, parent_type, parent_id, fk_user_creat FROM `llx_dolimeet_dolimeetdocuments`;
DROP TABLE `llx_dolimeet_dolimeetdocuments`;
DROP TABLE `llx_dolimeet_dolimeetdocuments_extrafields`;

ALTER TABLE `llx_saturne_object_signature` ADD `attendance` SMALLINT NULL AFTER `transaction_url`;

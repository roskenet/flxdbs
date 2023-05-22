select * from production_flow_definitions;

INSERT INTO production_flow_definitions (id, key, version, consumer, data_type, set, status, definition, created_at)
VALUES ( '42d31d0f-66a8-4aab-999f-76f43078f2c1',
         'ZSTUDIOS_OUTFIT_FLOW',
         1,
         'ZALANDO',
         'OUTFIT',
         'A',
         'ACTIVE',
         '{"key": "ZSTUDIOS_OUTFIT_FLOW", "consumer": "ZALANDO", "data_type": "OUTFIT", "set": "A", "step_definitions": [{"key": "OUTFIT_EDIT", "enabled": true, "is_external": false, "permissions": {"step": {"finish": ["Apps/ZStudios/Backstage/Flows/Outfitflow/Steps/Outfit-Edit/Finish"]}, "custom_permissions": {"attributes": {"put": ["Apps/ZStudios/Backstage/Flows/Outfitflow/Steps/Outfit-Edit/Attributes/Put"]}}}, "override_user": false, "error_transitions": {}, "transition_key": "PUBLISH_OUTFIT", "required_statuses": [], "step_dependencies": []}]}',
         now());

SELECT * FROM production_flow_instances WHERE id = '4ec3f4d5-06b9-43bd-b328-2d3ae302cd17';

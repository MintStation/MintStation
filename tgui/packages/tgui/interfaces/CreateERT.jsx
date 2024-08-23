// THIS IS A NOVA SECTOR UI FILE
import { useBackend } from '../backend';
import {
  Button,
  Flex,
  Grid,
  Input,
  LabeledList,
  Section,
  Stack,
  Tabs,
  TextArea,
} from '../components';
import { Window } from '../layouts';

export const CreateERT = (props) => {
  const { act, data } = useBackend();
  const { ert_template, ert_name, ert_description, error, templates } = data;

  return (
    <Window title="Create Emergency Response Team" width={325} height={525}>
      <Window.Content>
        {!!error && (
          <NoticeBox textAlign="center" color="red">
            {error}
          </NoticeBox>
        )}
        <Tabs>
          <Tabs.Tab
            label="Template"
            selected={data.activeTab === 'template'}
            onClick={() => act('set_active_tab', { activeTab: 'template' })}
          >
            <Section title="Select ERT Template:" textAlign="center">
              <Input
                width="100%"
                mt={1}
                value={ert_template}
                onChange={(e, value) =>
                  act('update_ert_template', {
                    updated_template: value,
                  })
                }
              >
                <OptionList>
                  {templates.map((template) => (
                    <Option key={template} value={template}>
                      {template}
                    </Option>
                  ))}
                </OptionList>
              </Input>
            </Section>
          </Tabs.Tab>
          <Tabs.Tab
            label="Settings"
            selected={data.activeTab === 'settings'}
            onClick={() => act('set_active_tab', { activeTab: 'settings' })}
          >
            <Section title="ERT Name:" textAlign="center">
              <Input
                width="100%"
                mt={1}
                value={ert_name}
                onChange={(e, value) =>
                  act('update_ert_name', {
                    updated_name: value,
                  })
                }
              />
            </Section>
            <Section title="ERT Description:" textAlign="center">
              <TextArea
                height="200px"
                mb={1}
                value={ert_description}
                onChange={(e, value) =>
                  act('update_ert_description', {
                    updated_description: value,
                  })
                }
              />
            </Section>
          </Tabs.Tab>
        </Tabs>
        <Stack vertical>
          <Stack.Item>
            <Button.Confirm
              fluid
              icon="check"
              color="good"
              textAlign="center"
              content="Create ERT"
              onClick={() => act('create_ert')}
            />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

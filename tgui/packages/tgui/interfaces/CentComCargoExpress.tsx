import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  Section,
} from '../components';
import { Window } from '../layouts';
import { CargoCatalog } from './Cargo/CargoCatalog';
import { InterfaceLockNoticeBox } from './common/InterfaceLockNoticeBox';

type Data = {
  locked: BooleanLike;
  points: number;
  usingBeacon: BooleanLike;
  beaconzone: string;
  beaconName: string;
  canBuyBeacon: BooleanLike;
  hasBeacon: BooleanLike;
  printMsg: string;
  message: string;
};

export function CentComCargoExpress(props) {
  const { data } = useBackend<Data>();
  const { locked } = data;

  return (
    <Window width={600} height={700}>
      <Window.Content scrollable>
        <InterfaceLockNoticeBox accessText="a CentCom Generic-level ID card" />
        {!locked && <CentComCargoExpressContent />}
      </Window.Content>
    </Window>
  );
}

function CentComCargoExpressContent(props) {
  const { act, data } = useBackend<Data>();
  const {
    hasBeacon,
    message,
    points,
    usingBeacon,
    beaconzone,
    beaconName,
    canBuyBeacon,
    printMsg,
  } = data;

  return (
    <>
      <Section
        title="CentCom Cargo Express"
        buttons={
          <Box inline bold>
            <AnimatedNumber value={Math.round(points)} />
            {' credits'}
          </Box>
        }
      >
        <LabeledList>
          <LabeledList.Item label="Landing Location">
            <Button selected={!usingBeacon} onClick={() => act('LZCargo')}>
              Cargo Bay
            </Button>
            <Button
              selected={usingBeacon}
              disabled={!hasBeacon}
              onClick={() => act('LZBeacon')}
            >
              {beaconzone} ({beaconName})
            </Button>
            <Button disabled={!canBuyBeacon} onClick={() => act('printBeacon')}>
              {printMsg}
            </Button>
          </LabeledList.Item>
          <LabeledList.Item label="Notice">{message}</LabeledList.Item>
        </LabeledList>
      </Section>
      <CargoCatalog express />
    </>
  );
}

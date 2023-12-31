"use client";

import { useAccount } from "@starknet-react/core";

import { useDisplayBalance } from "../../hooks/useDisplayBalance";
import { useDisplayName } from "../../hooks/useDisplayName";
import { useIsMounted } from "../../hooks/useIsMounted";
import {
  useAccountModal,
  useConnectModal,
} from "../PharaohProvider/ModalContext";

type CustomConnectButtonProps = {
  children: (props: {
    /** The currently connected user starknet address */
    address?: string;
    /** Id of the connector used by the currently connected wallet */
    connectorId?: string;
    /** Formatted balance of the currently connected user */
    displayBalance?: string;
    /** Opens the account modal */
    openAccountModal?: () => void;
    /** Opens the wallet connection modal */
    openConnectModal?: () => void;
    /** Whether the connect button is ready to be displayed or not */
    ready: boolean;
    /** Starknet id name of the currently connected user */
    starkName?: string;
    /** truncated address of the currently connected user */
    truncatedAddress?: string;
  }) => React.ReactNode;
};

export function CustomConnectButton(props: CustomConnectButtonProps) {
  const { children } = props;
  const { address, connector } = useAccount();
  const mounted = useIsMounted();
  const { openConnectModal } = useConnectModal();
  const { openAccountModal } = useAccountModal();
  const { starkName, truncatedAddress } = useDisplayName();
  const displayBalance = useDisplayBalance();

  const ready = mounted;
  const connectorId = connector?.id;

  return children({
    address,
    connectorId,
    displayBalance,
    openAccountModal,
    openConnectModal,
    ready,
    starkName,
    truncatedAddress,
  });
}

CustomConnectButton.displayName = "";

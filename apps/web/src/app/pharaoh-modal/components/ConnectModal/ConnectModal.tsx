import { useAccount, useConnect } from "@starknet-react/core";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/app/_ui/Modal";
import Button from "@/app/_ui/button";
import { useEffect } from "react";
import Image from "next/image";

type ConnectModalProps = {
  onClose: () => void;
  open: boolean;
};
export function ConnectModal(props: ConnectModalProps) {
  const { onClose, open } = props;
  const { address } = useAccount();
  const { connect, connectors } = useConnect();

  useEffect(() => {
    if (address !== undefined) {
      onClose();
    }
  }, [address, onClose]);

  return (
		<Dialog
			modal
			onOpenChange={(open: any) => !open && onClose()}
			open={open}
		>
			<DialogContent>
				<DialogHeader>
					<DialogTitle>Connect a wallet</DialogTitle>
				</DialogHeader>
				<div className="flex flex-col gap-4">
					{connectors.map((connector) => (
						<Button
							key={connector.id}
							onClick={() => connect({ connector })}
							disabled={!connector.available()}
							variant="secondary"
						>
							<Image
								src={connector.icon.dark!}
								width={20}
								height={20}
								alt="wallet icon"
								className="w-4 h-4 mr-2"
							/>
							Connect {connector.name}
						</Button>
					))}
				</div>
			</DialogContent>
		</Dialog>
	);
}

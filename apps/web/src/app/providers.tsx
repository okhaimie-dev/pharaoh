"use client";

import { StarknetProvider } from "@/components/starknet-provider";
import { type PropsWithChildren } from "react";

import { PharaohProvider } from "./pharaoh-modal";

export default function Providers(props: PropsWithChildren) {
  const { children } = props;

  return (
		<StarknetProvider>
			<PharaohProvider>{children}</PharaohProvider>
		</StarknetProvider>
	);
}

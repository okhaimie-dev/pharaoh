import { type PropsWithChildren } from "react";

import { ModalProvider } from "./ModalContext";

function PharaohProvider(props: PropsWithChildren) {
  const { children } = props;
  return <ModalProvider>{children}</ModalProvider>;
}

export { PharaohProvider };

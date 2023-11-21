// TODO : See correct usage of Next Image component, Image optimization is not a free feature we actually need to pay for it on Vercel

import Link from "next/link";
import Image from "next/image";

import Divider from "../_ui/divider";
import { ConnectButton } from "../pharaoh-modal";
import Navigation from "./navigation";

/* eslint-disable @next/next/no-img-element */
export default function Header() {
  return (
    <>
      <header className="flex flex-initial items-center justify-between p-4">
        <div className="flex items-center gap-4">
          <Link className="" href="/">
            <Image
              alt="Pharaoh"
              className="w-10 rounded-lg"
              src="/logo.png"
              width={50}
              height={20}
            />
          </Link>
          <Navigation />
        </div>
        <ConnectButton />
      </header>
      <Divider />
    </>
  );
}

import Link from "next/link";

type Props = {};

export default function Footer({ }: Props) {
    return (
        <footer className="text-secondary text-center py-8 text-opacity-60 px-8 text-sm w-full flex-shrink-0 bg-secondary/10 mt-12">
            <div className="mx-auto">
                Created by <Link className="font-bold" href="https://twitter.com/N0_crypto">@N0_crypto</Link>
            </div>

        </footer>);
}
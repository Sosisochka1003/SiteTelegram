-- CreateTable
CREATE TABLE "Users" (
    "UserId" TEXT NOT NULL,
    "Name" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("UserId")
);

-- CreateTable
CREATE TABLE "Messages" (
    "Id" SERIAL NOT NULL,
    "UserId" TEXT NOT NULL,
    "MessageText" TEXT NOT NULL,
    "TimeSend" TIMESTAMP(3) NOT NULL,
    "Who_send" TEXT NOT NULL,

    CONSTRAINT "Messages_pkey" PRIMARY KEY ("Id")
);

interface UserDto {
	firstName: string;
	lastName: string;
	profilePictureSrc: string;
	location: string;
	likesNb: number;
	matchesNb: number;
	fameRate: number;
}

interface NotificationDto {
	user: UserDto;
	viewed: boolean;
	message: string;
	date: Date;
}
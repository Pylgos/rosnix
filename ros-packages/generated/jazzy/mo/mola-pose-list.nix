{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libmaps,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_pose_list";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."mola_pose_list";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mrpt-libmaps mrpt-libposes ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libmaps mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_pose_list" = substituteSource {
      src = fetchgit {
        name = "mola_pose_list-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "6840fe92ecdc17bd2e802741358481b792839bc7";
        hash = "sha256-W6uJOTQzhE7riie9PUZ8AdcbzOCSk5sbczMMzHBhYvE=";
      };
    };
  });
  meta = {
    description = "C++ library for searchable pose lists";
  };
})

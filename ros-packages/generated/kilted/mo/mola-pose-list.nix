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
  version = "2.7.0-1";
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
        rev = "226d020ceb96e64bee086667117fe6fcabffad0b";
        hash = "sha256-XYKSqpIPHHHtp0Qi/2w8XZ0GYaenA5TUTLOPkkmcKsk=";
      };
    };
  });
  meta = {
    description = "C++ library for searchable pose lists";
  };
})

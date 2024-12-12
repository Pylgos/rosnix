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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."mola_pose_list";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libmaps mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_pose_list" = substituteSource {
      src = fetchgit {
        name = "mola_pose_list-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "efa43aec42929bbe2de4a7435395407d8160a4b9";
        hash = "sha256-dSR6CTg9UY9z1l9dwmWfbxBFyS3q4lylA+/HaBa55LA=";
      };
    };
  });
  meta = {
    description = "C++ library for searchable pose lists";
  };
})

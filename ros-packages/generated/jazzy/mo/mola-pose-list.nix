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
        rev = "28872a53f95dc589b6b9c5b0f5389e8b9aa03b0b";
        hash = "sha256-dSR6CTg9UY9z1l9dwmWfbxBFyS3q4lylA+/HaBa55LA=";
      };
    };
  });
  meta = {
    description = "C++ library for searchable pose lists";
  };
})

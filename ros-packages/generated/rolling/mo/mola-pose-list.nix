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
  version = "2.6.1-1";
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
        rev = "377c7fd49cd5872595ef78ecb98b25c5de7bd6ba";
        hash = "sha256-y4tlii7u93QT6IHfBVXDI9g0yI7Nr4y4/Tk4KYS1rxc=";
      };
    };
  });
  meta = {
    description = "C++ library for searchable pose lists";
  };
})

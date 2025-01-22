{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_traj_tools";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."mola_traj_tools";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_traj_tools" = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "7a624c7a8d7a5d3ca471f207c0688216191a7fe2";
        hash = "sha256-uPEv0AP8ZjNeC2jtyjchfQYNeyEbRnKmKaoFy1TY4J0=";
      };
    };
  });
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
})

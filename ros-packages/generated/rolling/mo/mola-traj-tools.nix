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
  version = "1.6.4-1";
  src = finalAttrs.passthru.sources."mola_traj_tools";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_traj_tools" = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "5ddc54626cda1c1702daa924f2cefd98fdd6b94c";
        hash = "sha256-h9Q9ZFI3ZQ09w1YOXI7VVM9volkYRz9TIZhJoNOINhQ=";
      };
    };
  });
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
})

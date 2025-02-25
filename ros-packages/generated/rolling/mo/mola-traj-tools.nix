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
  version = "1.6.2-1";
  src = finalAttrs.passthru.sources."mola_traj_tools";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_traj_tools" = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "a7411c2d6eb809a5c904f4e78299ef3ac8421dd8";
        hash = "sha256-upp4AAJhoHL3nujqeWWXqArp01qxpXnQUCYMyogEiJg=";
      };
    };
  });
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
})

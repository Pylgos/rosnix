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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_traj_tools";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libposes ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_traj_tools" = substituteSource {
        src = fetchgit {
          name = "mola_traj_tools-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "561e00907795f5d9fecfb2f3b8a178196a80dfe4";
          hash = "sha256-c1kzuFQnZ/AtVQkTtwbKVy/j4F6KTZBL70Ax2aAGOoE=";
        };
      };
    });
  };
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
})

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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."mola_traj_tools";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_traj_tools" = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "0ecbf3964423a736e6dcae3ed91621386fe42ef8";
        hash = "sha256-+ScUx4ChMAdg7YJ/oTqPWCoCxK/Zp+vvCv2XwI2JzVg=";
      };
    };
  });
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
})

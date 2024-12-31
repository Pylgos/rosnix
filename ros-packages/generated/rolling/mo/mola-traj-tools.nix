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
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."mola_traj_tools";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_traj_tools" = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "885f91ea4603cf2dcff164835afb12f50d726445";
        hash = "sha256-Aytnci+4Xdyr1tYY9QEIl4lJk5Gia4/fNOAL5Pep5hk=";
      };
    };
  });
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
})

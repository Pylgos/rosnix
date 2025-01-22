{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libbase,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_yaml";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."mola_yaml";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libbase ];
  passthru.sources = mkSourceSet (sources: {
    "mola_yaml" = substituteSource {
      src = fetchgit {
        name = "mola_yaml-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "426ae4785539e79ab66b7f0f6b2b17cef5fb58d6";
        hash = "sha256-0nmdXpyP+Vx9vlY9clFrEUoB564bEZ7q8vxJDBHGfDk=";
      };
    };
  });
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
})

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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_yaml";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libbase ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_yaml" = substituteSource {
        src = fetchgit {
          name = "mola_yaml-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "ff1b7d40f439bf7385cda39e1dcb997f61b7a15e";
          hash = "sha256-xzH/z3miq+AGVO/XLoeR4kMa11daIlf0CYHkQGcxQXc=";
        };
      };
    });
  };
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
})

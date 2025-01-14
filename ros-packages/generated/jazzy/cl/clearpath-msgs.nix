{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-motor-msgs,
  clearpath-platform-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_msgs";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."clearpath_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-motor-msgs clearpath-platform-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "7f6fce9bc8efc7af903b9c3cd32fcf6b5fc8d710";
        hash = "sha256-Oe7CSqts33VP7OvUbgvVDQPFpE/5LGTgYzc1XB2YuSU=";
      };
    };
  });
  meta = {
    description = "Metapackage for Clearapth messages.";
  };
})

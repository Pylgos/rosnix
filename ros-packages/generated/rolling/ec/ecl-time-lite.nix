{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-errors,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_time_lite";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."ecl_time_lite";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_time_lite" = substituteSource {
      src = fetchgit {
        name = "ecl_time_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "de7568525ae10b8c0a91cbc55c71cb595ac38613";
        hash = "sha256-xUWy6QEatAillIK/EUqV549irG+mWxeknSHHCLIkMT0=";
      };
    };
  });
  meta = {
    description = "\n     Provides a portable set of time functions that are especially useful for\n     porting other code or being wrapped by higher level c++ classes.\n  ";
  };
})

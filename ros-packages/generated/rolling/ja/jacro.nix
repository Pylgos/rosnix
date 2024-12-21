{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "jacro";
  version = "0.2.0-2";
  src = finalAttrs.passthru.sources."jacro";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" ]; };
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-rich" ]; };
  checkInputs = [ ament-cmake-pytest std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pre-commit" ]; };
  passthru.sources = mkSourceSet (sources: {
    "jacro" = substituteSource {
      src = fetchgit {
        name = "jacro-source";
        url = "https://github.com/ros2-gbp/jacro-release.git";
        rev = "1fbbdf79bcc757a2ae210536c9ddbe567ed168da";
        hash = "sha256-GOJXhMMGAjLXb36duyMfkUl89UDpZkL6feDp485vnMg=";
      };
    };
  });
  meta = {
    description = "TODO: Project Short Description";
  };
})

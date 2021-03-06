describe('Multiselect autocomplete', function () {
  var $fixture;

  describe('with no organsation selected', function () {
    fixture.preload("multiselect_autocomplete/none_selected.html.erb");

    beforeEach(function () {
      fixture.load("multiselect_autocomplete/none_selected.html.erb");
      $fixture = $(fixture.el)
        .find('[data-module="multiselect-autocomplete"]');
      new GOVUKAdmin.Modules.MultiselectAutocomplete().start($fixture);
    });

    it('has nothing selected', function () {
      expect(numberOfOrganisations()).toBe(1);
      assertNthFilterIsEmpty(0);
    });

    it('can autocomplete', function (done) {
      autoCompleteTextInput().val('minist');

      waitForElements($fixture, 'li')
        .then(function ($lis) {
          expect($lis.length).toBe(1);
          var $li = $lis.eq(0);
          expect($li.text()).toBe('Ministry of Defence');
          expect($li.is(':visible')).toBe(true);

          $li.click();
        })
        .then(function () {
          return wait(function () {
            return autoCompleteTextInput().val() === 'Ministry of Defence';
          });
        })
        .then(function () {
          var $select = $fixture.find('select');
          expect($select.val()).toBe('ministry-of-defence');
          done();
        });
    });

    it('can add a new organisation for filtering', function (done) {
      expect(numberOfOrganisations()).toBe(1);

      addOrganisation()
        .then(function () {
          expect(numberOfOrganisations()).toBe(2);

          assertNthFilterIsEmpty(0);
          assertNthFilterIsEmpty(1);
          done();
        });
    });

    it('clears the input when removing the organisation', function (done) {
      expect(numberOfOrganisations()).toBe(1);

      removeOrganisation(0);

      wait(
        function () {
          return !autoCompleteTextInput().eq(0).val();
        })
        .then(function () {
          expect(numberOfOrganisations()).toBe(1);
          done();
        });
    });
  });

  describe('with one organisation selected', function () {
    fixture.preload("multiselect_autocomplete/one_selected.html.erb");

    beforeEach(function () {
      fixture.load("multiselect_autocomplete/one_selected.html.erb");
      $fixture = $(fixture.el)
        .find('[data-module="multiselect-autocomplete"]');
      new GOVUKAdmin.Modules.MultiselectAutocomplete().start($fixture);
    });

    it('has an element selected', function () {
      expect(numberOfOrganisations()).toBe(1);
      assertNthFilterHasValue(0, 'ministry-of-defence', 'Ministry of Defence');
    });

    it('can add a new organisation for filtering', function (done) {
      expect(numberOfOrganisations()).toBe(1);

      addOrganisation()
        .then(function () {
          expect(numberOfOrganisations()).toBe(2);

          assertNthFilterHasValue(0, 'ministry-of-defence', 'Ministry of Defence');
          assertNthFilterIsEmpty(1);
          done();
        });
    });

    it('clears the input when removing the organisation', function (done) {
      expect(numberOfOrganisations()).toBe(1);

      removeOrganisation(0);

      wait(
        function () {
          return !autoCompleteTextInput().eq(0).val();
        })
        .then(function () {
          expect(numberOfOrganisations()).toBe(1);
          done();
        })
    });
  });

  describe('with two organisations selected', function () {
    fixture.preload("multiselect_autocomplete/two_selected.html.erb");

    beforeEach(function () {
      fixture.load("multiselect_autocomplete/two_selected.html.erb");
      $fixture = $(fixture.el)
        .find('[data-module="multiselect-autocomplete"]');
      new GOVUKAdmin.Modules.MultiselectAutocomplete().start($fixture);
    });

    it('has two elements selected', function () {
      expect(numberOfOrganisations()).toBe(2);
      assertNthFilterHasValue(0, 'cabinet-office', 'Cabinet Office');
      assertNthFilterHasValue(1, 'ministry-of-defence', 'Ministry of Defence');
    });

    it('can remove the first organisation', function (done) {
      expect(numberOfOrganisations()).toBe(2);
      assertNthFilterHasValue(0, 'cabinet-office', 'Cabinet Office');
      assertNthFilterHasValue(1, 'ministry-of-defence', 'Ministry of Defence');

      removeOrganisation(0);

      wait(
        function () {
          return numberOfOrganisations() === 1;
        })
        .then(function () {
          assertNthFilterHasValue(0, 'ministry-of-defence', 'Ministry of Defence');
          done();
        });
    });

    it('can remove the second organisation', function (done) {
      expect(numberOfOrganisations()).toBe(2);
      assertNthFilterHasValue(0, 'cabinet-office', 'Cabinet Office');
      assertNthFilterHasValue(1, 'ministry-of-defence', 'Ministry of Defence');

      removeOrganisation(1);

      wait(
        function () {
          return numberOfOrganisations() === 1;
        })
        .then(function () {
          assertNthFilterHasValue(0, 'cabinet-office', 'Cabinet Office');
          done();
        })
    });
  });

  function assertNthFilterIsEmpty(filterIndex) {
    assertNthFilterHasValue(filterIndex, '', '');
  }

  function assertNthFilterHasValue(filterIndex, value, label) {
    var $wrapper =
      $fixture
        .find('.js-multiselect-wrapper')
        .eq(filterIndex);

    var $select = $wrapper.find('select').first();
    var $input = $wrapper.find('input[type=text]').first();

    expect($select.val()).toBe(value);
    expect($input.val()).toBe(label);
  }

  function numberOfOrganisations() {
    return $fixture.find('.js-multiselect-wrapper').length;
  }

  function addOrganisation() {
    var numberOfOrganisations = autoCompleteTextInput().length;
    var $addOrganisation = $fixture.find('.js-add-multiselect');
    $addOrganisation.click();
    return wait(function () {
      return autoCompleteTextInput().length === numberOfOrganisations + 1;
    });
  }

  function removeOrganisation(index) {
    var $removeOrganisation = $fixture.find('.js-remove-multiselect').eq(index);
    $removeOrganisation.click();
  }

  function autoCompleteTextInput() {
    return $fixture.find('input[type=text]');
  }
});
